//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.targets
{

import com.nesium.logging.TrazzleLogger;
import org.helvector.logging.ILoggerTarget;

/**
 * Log target that traces output to Trazzle.
 *
 * @see http://www.nesium.com/products/trazzle/
 */
public class Trazzle implements ILoggerTarget
{
	public function Trazzle()
	{
		super();
		_trazzle = new TrazzleLogger();
	}

	private var _trazzle:TrazzleLogger;

	public function write(message:String):void
	{
		_trazzle.log(message);
	}

}
}