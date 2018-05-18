/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarysystem;

import javax.swing.JOptionPane;

/**
 *
 * @author Andrew
 */
public class FunctionValidation {

    public boolean Validation(String name, String name2, String phone, String address) {
        if (nameValidation(name)) {
            if (nameValidation(name2)) {
                if (phoneValidation(phone)) {
                    if (addressValidation(address)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public boolean Validation(String isbn, String title, String author, String year, String edition, String category, String publisher, String Copies) {
        if (isbnValidation(isbn)) {
            if (nameValidation(title)) {
                if (nameValidation(author)) {
                    if (yearValidation(year)) {
                        if (digitValidation(edition)) {
                            if (nameValidation(category)) {
                                if (nameValidation(publisher)) {
                                    if (digitValidation(Copies)) {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public boolean Validation(String title, String author, String year, String edition, String category, String publisher, String Copies) {

        if (nameValidation(title)) {
            if (nameValidation(author)) {
                if (yearValidation(year)) {
                    if (digitValidation(edition)) {
                        if (nameValidation(category)) {
                            if (nameValidation(publisher)) {
                                if (digitValidation(Copies)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public boolean nameValidation(String text) {
        if (text.length() != 0 && text.matches("[a-zA-Z\\s_.-]+")) {
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Incorrect Name. Must not be Null and Must Contain letters");
            return false;
        }
    }

    public boolean phoneValidation(String number) {
        if (number.length() <= 10 && number.matches("[0-9]+")) {
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Incorrect Phone Number. Must contain Numbers and must be 10 digits Long");
            return false;
        }
    }

    public boolean addressValidation(String text) {
        if (text.length() >= 10) {
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Incorrect Address, Address Must be Valid");
            return false;
        }
    }

    public boolean isbnValidation(String number) {
        if (number.length() == 13 && number.matches("[0-9]+")) {
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Incorrect ISBN. Must contain Numbers and must be 13 digits Long");
            return false;
        }
    }

    public boolean yearValidation(String number) {
        if (number.length() == 4 && number.matches("[0-9]+")) {
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Incorrect Year. Enter a Valid Year");
            return false;
        }
    }

    public boolean digitValidation(String number) {
        if (number.length() != 0 && number.matches("[0-9]+")) {
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Incorrect Edition. Enter just the Edtion number");
            return false;
        }
    }
}
