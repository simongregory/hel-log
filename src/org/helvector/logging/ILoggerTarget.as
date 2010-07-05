//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging
{

/**
 * Contract for objects acting as a Logging Target.
 *
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 */
public interface ILoggerTarget
{
	/**
	 * Send the requested message to the output stream of the target. A target
	 * uses this method to translate the message into the appropriate format for
	 * transmission, storage, or display.
	 */
	function write(message:String):void;
}

}