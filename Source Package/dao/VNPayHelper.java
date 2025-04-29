package dao;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import model.Order;

public class VNPayHelper {

    private static final String VNP_VERSION = "2.1.0";
    private static final String VNP_COMMAND = "pay";
    private static final String VNP_TMNCODE = "SQGAJR6C"; // Bỏ dấu cách thừa
    private static final String VNP_HASHSECRET = "24P3DE4RC8G9AIFR9L6XYO1L0UANPV8F"; // Bỏ dấu cách thừa
    private static final String VNP_PAYURL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"; 
    private static final String VNP_RETURNURL = "http://localhost:8081/SWP391/vnpay_return"; // URL nhận kết quả thanh toán

    public static String createPaymentUrl(Order order) throws UnsupportedEncodingException {
        Map<String, String> vnpParams = new HashMap<>();
        vnpParams.put("vnp_Version", VNP_VERSION);
        vnpParams.put("vnp_Command", VNP_COMMAND);
        vnpParams.put("vnp_TmnCode", VNP_TMNCODE);
        vnpParams.put("vnp_Amount", String.valueOf(Math.round(order.getTotalPrice() * 100))); // nhân 100
        vnpParams.put("vnp_CurrCode", "VND");
        vnpParams.put("vnp_TxnRef", String.valueOf(order.getId()));
        vnpParams.put("vnp_OrderInfo", "Thanh toan don hang: " + order.getId());
        vnpParams.put("vnp_OrderType", "other");
        vnpParams.put("vnp_Locale", "vn");
        vnpParams.put("vnp_ReturnUrl", VNP_RETURNURL);

        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        Date date = calendar.getTime();
        String vnp_CreateDate = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(date);
        vnpParams.put("vnp_CreateDate", vnp_CreateDate);

        calendar.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(calendar.getTime());
        vnpParams.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnpParams.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        for (int i = 0; i < fieldNames.size(); i++) {
            String fieldName = fieldNames.get(i);
            String value = vnpParams.get(fieldName);
            if (value != null && !value.isEmpty()) {
                hashData.append(fieldName).append('=').append(URLEncoder.encode(value, StandardCharsets.UTF_8.toString()));
                query.append(fieldName).append('=').append(URLEncoder.encode(value, StandardCharsets.UTF_8.toString()));
                if (i < fieldNames.size() - 1) {
                    hashData.append('&');
                    query.append('&');
                }
            }
        }

        String secureHash = hmacSHA512(VNP_HASHSECRET, hashData.toString());
        query.append("&vnp_SecureHash=").append(secureHash);

        return VNP_PAYURL + "?" + query.toString();
    }

    public static boolean verifySignature(Map<String, String> fields, String vnp_SecureHash) {
        try {
            Map<String, String> sortedFields = new TreeMap<>(fields);
            sortedFields.remove("vnp_SecureHashType");
            sortedFields.remove("vnp_SecureHash");

            StringBuilder sb = new StringBuilder();
            for (Map.Entry<String, String> entry : sortedFields.entrySet()) {
                if (entry.getValue() != null && !entry.getValue().isEmpty()) {
                    sb.append(entry.getKey())
                      .append('=')
                      .append(URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8.toString()))
                      .append('&');
                }
            }
            if (sb.length() > 0) {
                sb.deleteCharAt(sb.length() - 1); // Xóa dấu & cuối
            }

            String signValue = hmacSHA512(VNP_HASHSECRET, sb.toString());
            return signValue.equalsIgnoreCase(vnp_SecureHash);
        } catch (Exception e) {
            return false;
        }
    }

    private static String hmacSHA512(String key, String data) {
        try {
            if (key == null || data == null) {
                return null;
            }
            Mac hmac512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(secretKeySpec);
            byte[] bytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(bytes);
        } catch (Exception ex) {
            return null;
        }
    }

    private static String bytesToHex(byte[] hash) {
        StringBuilder result = new StringBuilder();
        for (byte b : hash) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }
}
