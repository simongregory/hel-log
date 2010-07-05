//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.helpers
{

import org.helvector.logging.ILoggerTarget;

/**
 * Logging target specifically for use with the unit tests. Used to inpect the
 * results to log() calls.
 *
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 *
 * @author Simon Gregory
 * @since  15.05.2010
 */
public class UnitTestTarget implements ILoggerTarget
{

	public function UnitTestTarget()
	{
		super();
	}

	public var message:String;

	public function write(message:String):void
	{
		this.message = message;
	}

	public function clear():void
	{
		message = null;
	}
}

}