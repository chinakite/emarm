/**
 * 
 */
package com.ideamoment.emarm.copyright;

import com.ideamoment.ideadp.exception.IdeaBaseException;


/**
 * @author Chinakite
 *
 */
public class CopyrightException extends IdeaBaseException {

    public CopyrightException(String code, String message) {
        super(code, message);
    }

    public CopyrightException(String code, String message, Throwable t) {
        super(code, message, t);
    }
}
