/**
 * 
 */
package br.com.ft.gdp.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import br.com.ft.gdp.exception.ObjectNotFoundException;
import br.com.ft.gdp.models.domain.Anamnese;
import br.com.ft.gdp.repository.AnamneseRepository;

/**
 * AnamnesisService.java
 *
 * @author <a href="henriquedreyer@gmail.com">Henrique Dreyer</a>
 *
 * @since 14 de set de 2019
 * 
 */
@Service
public class AnamneseService implements GenericService<Anamnese, Long> {

    @Autowired
    private AnamneseRepository dao;

    @Override
    public Page<Anamnese> searchEntityPage(Pageable pageRequest) {
        return dao.findAll(pageRequest);
    }

    @Override
    public Anamnese findById(Long id) {
        try {
            return dao.findById(id).orElseThrow(
                                                () -> new ObjectNotFoundException(
                                                        String.format("Anamnesis Item ID: [%s] não encontrado!", id)));

        } catch (ObjectNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Anamnese update(Long id, Anamnese entity) {
        Anamnese anamnese = findById(id);
        BeanUtils.copyProperties(entity, anamnese, "id");
        return anamnese;
    }

    @Override
    public void delete(Anamnese entity) {
        deleteById(entity.getId());
    }

    @Override
    public void deleteById(Long id) {
        Anamnese anamnese = findById(id);
        dao.delete(anamnese);
    }

    @Override
    public Anamnese persist(Anamnese entity) {
        entity.setId(null);
        return dao.save(entity);
    }

}
