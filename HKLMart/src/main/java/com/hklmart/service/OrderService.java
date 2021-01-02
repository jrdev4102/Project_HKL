package com.hklmart.service;

import com.hklmart.domain.OrderVO;
import com.hklmart.persistence.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderService {

    private final OrderDAO orderDAO;

    public OrderService(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }


    public OrderVO getOrderMemberService(String memberId) {

        return orderDAO.getOrderMemberService(memberId);
    }

    public OrderVO getOrderProdutService(String productCode) {
        return orderDAO.getOrderProductService(productCode);
    }
}
