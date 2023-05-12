package vn.edu.hcmuaf.fit.AdminController;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import vn.edu.hcmuaf.fit.DAO.PromotionCodeDAO;
import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.beans.order.Order;
import vn.edu.hcmuaf.fit.beans.order.OrderDetail;
import vn.edu.hcmuaf.fit.beans.promotion_code.PromotionCode;
import vn.edu.hcmuaf.fit.services.OrderDetailService;
import vn.edu.hcmuaf.fit.services.OrderService;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "Invoice", value = "/admin-page/Invoice")
public class Invoice extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idOrder = request.getParameter("id");
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"invoice-" + idOrder + ".pdf\"");
        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
        List<OrderDetail> listOd = OrderDetailService.getInstance().getListDetailsFromOrdId(idOrder);
        Order order = OrderService.getInstance().getOrderById(idOrder);
        UserInformation custommer = UserInformationService.getInstance().getUserInfo(order.getCustomer_id());
        Document document = new Document();
        try {
            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            // Add content to PDF document

            File fontFile = new File(request.getServletContext().getAttribute("FONT_DIR") + File.separator + "Arial Unicode MS.ttf");

            System.out.println(fontFile.getAbsolutePath());
            BaseFont unicodeFont = BaseFont.createFont(fontFile.getAbsolutePath(), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(unicodeFont, 12, Font.NORMAL, BaseColor.BLACK);

            Paragraph title = new Paragraph("HOÁ ĐƠN BÁN HÀNG", font);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            Chunk chunk = new Chunk(idOrder, new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL));
            Barcode128 barcode = new Barcode128();
            barcode.setCode(chunk.getContent());
            Image image = barcode.createImageWithBarcode(writer.getDirectContent(), BaseColor.BLACK, BaseColor.BLACK);
            chunk = new Chunk(image, 0, 0, true);
            document.add(chunk);

            // phần thông tin khách hàng
            Paragraph customerInfo = new Paragraph("Mã hóa đơn: #" + idOrder + "\nTên khách hàng: " + custommer.getFull_name() + "\nSố điện thoại: " + custommer.getPhone_number() + "\nEmail: " + custommer.getEmail() + "\nĐịa chỉ: " + order.getAddress() + "\nNgày đặt: " + order.getOrd_date() + "\n\n", font);
            customerInfo.setPaddingTop(20);
            document.add(customerInfo);

            // phần chi tiết hóa đơn
            float[] columnWidths = {0.75f, 1f, 3.5f, 1f, 1f, 0.5f, 1.5f, 1.5f};
            PdfPTable detail = new PdfPTable(8);
            detail.setWidths(columnWidths);
            detail.setHorizontalAlignment(Element.ALIGN_CENTER); // đặt vị trí của bảng ở giữa trang
            detail.setWidthPercentage(100);
            detail.addCell(new Phrase("STT", font));
            detail.addCell(new Phrase("Mã SP", font));
            detail.addCell(new Phrase("Tên SP", font));
            detail.addCell(new Phrase("Size", font));
            detail.addCell(new Phrase("Màu", font));
            detail.addCell(new Phrase("SL", font));
            detail.addCell(new Phrase("Đơn giá", font));
            detail.addCell(new Phrase("Thành tiền", font));
            int i = 0;
            for (OrderDetail item : listOd) {
                detail.addCell(String.valueOf(i += 1));
                detail.addCell(new Phrase(item.getProd_id(), font));
                detail.addCell(new Phrase(item.getProd_name(), font));
                detail.addCell(new Phrase(item.getProd_size(), font));
                detail.addCell(new Phrase(item.getProd_color(), font));
                detail.addCell(new Phrase(String.valueOf(item.getQuantity()), font));
                detail.addCell(new Phrase(String.valueOf(format.format(item.getPrice())), font));
                detail.addCell(new Phrase(String.valueOf(format.format(item.getQuantity() * item.getPrice())), font));
            }
            document.add(detail);

            // vận chuyển
            Paragraph transport = new Paragraph("Phí vận chuyển: " + format.format(30000) + "đ", font);
            transport.setAlignment(Element.ALIGN_RIGHT);
            document.add(transport);

            if (!order.getCode_id().equals("NoCode")) {
                PromotionCode code = new PromotionCodeDAO().getPromotionCodeById(order.getCode_id());
                Paragraph promo = new Paragraph("Giảm giá: -" + format.format(code.getDiscount_money()) + "đ", font);
                promo.setAlignment(Element.ALIGN_RIGHT);
                document.add(promo);
            }

            // tổng
            Paragraph total = new Paragraph("Tổng số tiền: " + format.format(order.getTotal()) + "đ", font);
            total.setAlignment(Element.ALIGN_RIGHT);
            document.add(total);

            Paragraph statusPayment = new Paragraph("Tình trạng thanh toán: " + (order.getPayment_status() == 0 ? "Chưa thanh toán" : "Đã thanh toán"), font);
            statusPayment.setAlignment(Element.ALIGN_RIGHT);
            statusPayment.setPaddingTop(20);
            document.add(statusPayment);

        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }
        document.close();
    }
}