//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.tools
{

/**
 * Contract for objects which collate runtime enviroment information and return
 * a representation of it as a string.
 *
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 *
 * @author Simon Gregory
 * @since  04.07.2010
 */
public interface ILogEnv
{
    /**
     * A string describing the current runtime environment.
     */
    function get description():String;

    /**
     * Update the object so it's <code>description</code> property reflects the
     * most immediately available reflection of the runtime environment. Then
     * return the resulting string.
     */
    function update():String;
}

}