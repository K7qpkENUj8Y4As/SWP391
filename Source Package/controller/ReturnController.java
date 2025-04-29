package controller;

import dao.OrderDAO;
import dao.VNPayHelper;
import model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ReturnController extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy tất cả các tham số VNPAY trả về
        Map<String, String> vnpParams = new HashMap<>();
        Map<String, String[]> paramMap = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
            vnpParams.put(entry.getKey(), entry.getValue()[0]);
        }

        String vnp_SecureHash = vnpParams.get("vnp_SecureHash");

        // Kiểm tra tính hợp lệ chữ ký
        boolean isValid = VNPayHelper.verifySignature(vnpParams, vnp_SecureHash);

        if (isValid) {
            String vnp_ResponseCode = vnpParams.get("vnp_ResponseCode"); // Mã phản hồi
            String vnp_TxnRef = vnpParams.get("vnp_TxnRef");             // Mã giao dịch (chính là orderId bạn gửi sang)

            if ("00".equals(vnp_ResponseCode)) {
                // Thanh toán thành công
                int orderId = Integer.parseInt(vnp_TxnRef);
                orderDAO.updateStatus(orderId, 1); // Cập nhật trạng thái đơn hàng thành "Đã thanh toán"
                request.setAttribute("message", "Thanh toán thành công! Cảm ơn bạn đã mua hàng.");
            } else {
                request.setAttribute("message", "Thanh toán thất bại hoặc bị hủy.");
            }
        } else {
            request.setAttribute("message", "Dữ liệu không hợp lệ (invalid signature).");
        }

        request.getRequestDispatcher("/view/common/PaymentResult.jsp").forward(request, response);
    }
}