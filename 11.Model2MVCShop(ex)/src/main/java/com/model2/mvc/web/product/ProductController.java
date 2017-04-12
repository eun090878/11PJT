package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println(":: ����� "+this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//@RequestMapping("/addProductView.do")
	@RequestMapping( value="addProduct", method=RequestMethod.GET )
	public String addProductView() throws Exception {
		
		System.out.println("/product/addProduct : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
//	@RequestMapping("/addProduct.do")
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	   public String addProduct(@ModelAttribute("product") Product product,HttpSession session ) throws Exception{
	  
		System.out.println("/product/addProduct:POST");

	      MultipartFile file=product.getFile();
	      System.out.println(" :: fileName :: " + file);
	      if(file !=null){
	         String fileName=file.getOriginalFilename();
	         product.setFileName(fileName);
	         
	         File filetemp=new File(session.getServletContext().getRealPath("/")+"images\\uploadFiles\\" + product.getFileName());
	      }
	      productService.addProduct(product);
	      
	      return "forward:/product/getProduct.jsp";
	   }
		
//	@RequestMapping("/getProduct.do")
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct( @RequestParam("prodNo") int prodNo,  @RequestParam("menu") String menu, Model model) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		if( menu.equals("manage")) {
			return "forward:/product/updateProductView.jsp";
		} else {
			return "forward:/product/readProduct.jsp";
		}		
	}
		
//	@RequestMapping("/getProduct")
	@RequestMapping( value="getJSONProduct/{prodNo}/{menu}", method=RequestMethod.GET )
	public void getJSONProduct( @PathVariable("prodNo") int prodNo,  
			@PathVariable("menu") String menu, Model model) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
	}
	
//	@RequestMapping("/updateProduct.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, Model model) throws Exception {
		
		System.out.println("��ǰ���� ���� �� ������ ���� �����ֱ�");
		System.out.println("/updateProduct");
		
		productService.updateProduct(product);
		product = productService.getProduct(product.getProdNo());
		
		//**@ModelAttribute("productOld") Product product�� ������ ����(regDate�� ���� ����)�� ������ �� ��, ������ ������ �����´�!
		//**�׸��� �� ������ ������ Scope�� ���ؼ� ����ְ� readProduct.jsp�� ����
		model.addAttribute("product", product);
		
		System.out.println("������ product ���� : " + product);
		
		return "/product/readProduct.jsp";
	}
	
	
//	@RequestMapping("/updateProductView.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.GET )
	public String updateProductView(@RequestParam("prodNo") int prodNo, Model  model) throws Exception {
		
		System.out.println("��ǰ������ �����ϱ����� View");
		System.out.println("/updateProductView");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
//	@RequestMapping("listProduct.do")
	@RequestMapping( value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search, @RequestParam("menu") String menu, Model model ) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
		
}
