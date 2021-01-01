package com.hklmart.service;

import com.hklmart.domain.*;
import com.hklmart.persistence.ProductDAO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductDAO productDAO;

    public ProductServiceImpl(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Override
    public void registProduct() {
    }

    @Override
    public void deleteProduct() {
    }

    public List<ProductListMainDTO> getUserProductList(ProductPageCriteriaVO cri) {
        return productDAO.getUserProductList(cri);
    }

    public List<ProductListMainDTO> getMainCategoryUserProductList(ProductPageCriteriaVO cri) {


        return productDAO.getMainCategoryUserProductList(cri);
    }

    public int codeCheckTest(String insertCode) {

        return productDAO.codeCheck(insertCode);
    }

    public ProductDetailDTO getProductDetail(String productCode) {

        return productDAO.getProductDetail(productCode);
    }

    public List<BoardReviewListDTO> getProductDetailReview(PageCriteriaVO cri,String productCode) {
        System.out.println("service1111111111111111111111111"+cri);
        return productDAO.getProductDetailReview(cri,productCode);
    }

}

