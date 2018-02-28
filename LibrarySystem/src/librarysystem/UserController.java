package librarysystem;

import librarysystem.form.MainForm;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Andrew
 */
public class UserController {

    LoginDialog login;

    public void createLogginDialog(MainForm form) {
        login = new LoginDialog(form);
    }

    public LoginDialog getInstance() {
        return login;
    }
}
