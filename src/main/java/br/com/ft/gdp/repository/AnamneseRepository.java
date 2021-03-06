package br.com.ft.gdp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.ft.gdp.models.domain.Anamnese;

/**
 * AnamneseDao.java
 *
 * @author <a href="henriquedreyer@gmail.com">Henrique Dreyer</a>
 *
 * @since 12 de set de 2019
 * 
 */
@Repository
public interface AnamneseRepository extends JpaRepository<Anamnese, Long> {

    /**
     * @param id
     * @return
     */
    public Optional<Anamnese> findById(Long id);

}
