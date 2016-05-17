/**
 * 
 */
package com.ideamoment.emarm.mediares;

import com.ideamoment.ideadp.exception.IdeaBaseException;

/**
 * @author Chinakite
 *
 */
public class MediaResourceException  extends IdeaBaseException {

    public MediaResourceException(String code, String message, Throwable t) {
        super(code, message, t);
    }

    public MediaResourceException(String code, String message) {
        super(code, message);
    }
}
