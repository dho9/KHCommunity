package com.kh.app.ticket.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app.store.entity.Store;
import com.kh.app.ticket.entity.TicketOrder;

@Mapper
public interface TicketRepository {

	@Select("select ticket_id from ticket where store_id = #{storeId}")
	int findTicketIdByStoreId(int storeId);

	@Insert("insert into "
			+ "ticket_order"
			+ " (order_id, member_id, store_id, ticket_id,amount,total_price) values"
			+ "(#{orderId},#{memberId},#{storeId},#{ticketId},#{amount}, #{totalPrice})")
	int createOrder(TicketOrder order);


}
