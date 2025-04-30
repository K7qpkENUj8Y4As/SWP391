<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Flower Shop FAQs</title>
        <!-- Bootstrap 5 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-color: #fceeea;
                font-family: 'Segoe UI', sans-serif;
                padding: 40px;
            }
            .accordion-button {
                background-color: #fff5f3;
                font-weight: bold;
            }
            .accordion-button:not(.collapsed) {
                background-color: #ffe8e3;
                color: #000;
            }
            .contact-btn {
                background-color: #d48a9c;
                border: none;
            }
            .contact-btn:hover {
                background-color: #c47688;
            }
            .active {
                color: var(--primary-color) !important;
            }

            .active::after {
                width: 100% !important;
            }
        </style>
    </head>
    <body>
        <%@ include file="/view/components/Header.jsp" %>
        <div class="container">
            <h1 class="fw-bold mb-3">FAQs</h1>
            <p class="mb-4">Find answers to your most pressing questions about our flower delivery and care services.</p>

            <div class="accordion" id="faqAccordion">
                <!-- Item 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            What are your delivery options?
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                         data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            We offer same-day delivery for local orders placed before noon. For other areas, standard shipping options are available. You can choose your preferred delivery date at checkout.
                        </div>
                    </div>
                </div>

                <!-- Item 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            How do I place an order?
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Placing an order is easy! Simply browse our selection, add items to your cart, and proceed to checkout. You can create an account or check out as a guest.
                        </div>
                    </div>
                </div>

                <!-- Item 3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            What if my flowers arrive damaged?
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                         data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            If your flowers arrive damaged, please contact us within 24 hours. We will gladly replace them or issue a refund. Your satisfaction is our priority.
                        </div>
                    </div>
                </div>

                <!-- Item 4 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            How should I care for my flowers?
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                         data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            To keep your flowers fresh, trim the stems and place them in clean water. Avoid direct sunlight and change the water every few days. Follow the care instructions included with your order.
                        </div>
                    </div>
                </div>

                <!-- Item 5 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            Do you offer refunds?
                        </button>
                    </h2>
                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                         data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, we offer refunds for damaged or unsatisfactory products. Please reach out to our customer service team for assistance. We want to ensure you are completely happy with your purchase.
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contact -->
            <div class="mt-5">
                <h4 class="fw-bold">Still have questions?</h4>
                <p>We’re here to help you!</p>
                <button class="btn contact-btn text-white px-4">Contact</button>
            </div>
        </div>
        <%@ include file="/view/components/Footer.jsp" %>
    </body>
</html>



