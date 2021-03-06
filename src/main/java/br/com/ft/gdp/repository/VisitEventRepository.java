package br.com.ft.gdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.ft.gdp.models.domain.VisitEvent;

/**
 * Classe VisitEventRepository.java
 * 
 * @author <a href="mailto:williamsgomes45@gmail.com">Williams Gomes</a>
 *
 * @since 08 Sept, 2019
 */
@Repository
public interface VisitEventRepository extends JpaRepository<VisitEvent, Long> {

    /**
     * @param visitId
     * @return
     */
    List<VisitEvent> findByVisitId(Long visitId);

}
