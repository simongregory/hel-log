//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.targets
{

import flash.external.ExternalInterface;

import org.helvector.logging.ILoggerTarget;

/**
 * Provides a logger target that sends messages to the javascript console
 * provided by many web browsers. Tested, and working, with Safari, Firefox
 * (via Firebug), and Chrome. The runtime will need to have script access
 * enabled, and the relevant security sandbox settings applied.
 */
public class WebBrowser implements ILoggerTarget
{
	/**
	 * Sends the message to the browser console.
	 */
	public function write(message:String):void
	{
		if (ExternalInterface.available)
			ExternalInterface.call('console.log', message);
	}

}
}