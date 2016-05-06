/**
 * 
 */
package com.ideamoment.emarm.mediares;

import com.ideamoment.ideadp.exception.IdeaBaseException;


/**
 * @author Chinakite
 *
 */
public class DownloadException extends IdeaBaseException {

    public DownloadException(String code, String message, Throwable t) {
        super(code, message, t);
    }

}
