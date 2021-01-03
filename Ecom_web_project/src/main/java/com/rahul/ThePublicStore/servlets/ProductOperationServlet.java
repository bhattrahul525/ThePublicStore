package com.rahul.ThePublicStore.servlets;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rahul.ThePublicStore.dao.CategoryDao;
import com.rahul.ThePublicStore.dao.ProductDao;
import com.rahul.ThePublicStore.entities.Category;
import com.rahul.ThePublicStore.entities.Product;
import com.rahul.ThePublicStore.helper.FactoryProvider;
import javax.servlet.http.Part;


/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			
			String op=request.getParameter("operation");
			if(op.trim().equals("addCategory")) {
				
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				
				Category category= new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);
				
				HttpSession httpSession= request.getSession();
				httpSession.setAttribute("message", "Category added successfully");
				response.sendRedirect("admin.jsp");
				return;
			}
			else if(op.trim().equals("addProduct")){
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDescription");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part=request.getPart("pPic");
				
				Product p= new Product();
				p.setpName(pName);
				p.setpDescription(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				Category category=cdao.getCategoryById(catId);
				
				p.setCategory(category);
				
				ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				String path = request.getRealPath("image")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				
				FileOutputStream fos=new FileOutputStream(path);
				InputStream is=part.getInputStream();
				
				byte []data=new byte[is.available()];
				is.read(data);
				
				fos.write(data);
				
				fos.close();
				
				HttpSession httpSession= request.getSession();
				httpSession.setAttribute("message", "Product is added successfully");
				response.sendRedirect("admin.jsp");
				return;
			}
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
