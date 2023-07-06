package com.dzkashlach.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dzkashlach.model.Loans;

@Repository
public interface LoanRepository extends CrudRepository<Loans, Long> {

//	@PreAuthorize("hasRole('USER')")
	List<Loans> findByCustomerIdOrderByStartDtDesc(int customerId);

}
