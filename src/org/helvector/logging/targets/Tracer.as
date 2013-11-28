//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.targets
{
import org.helvector.logging.ILoggerTarget;

/**
 * Simple log target that traces output to the flashlog.txt file.
 */
public class Tracer implements ILoggerTarget
{
	public function Tracer()
	{
		super();
	}

	public function write(message:String):void
	{
		trace(message);
	}
}
}
