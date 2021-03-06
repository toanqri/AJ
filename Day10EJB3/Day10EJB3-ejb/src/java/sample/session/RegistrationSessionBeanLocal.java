/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sample.session;

import java.util.List;
import javax.ejb.Local;
import sample.registration.RegistrationDTO;

/**
 *
 * @author Suzy
 */
@Local
public interface RegistrationSessionBeanLocal {

    boolean checkLogin(String username, String password);

    List<RegistrationDTO> searchByLastname(String name);

    boolean deleteUser(String username);

    boolean updateUser(String username, String password, boolean roles);
    
}
