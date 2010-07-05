//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package
{

public function log(message:String, ...rest):void
{
	if (logger == null) init();
	logger.log(message, rest);
}

}

import org.helvector.logging.LogFactory;
import org.helvector.logging.ILogger;

var logger:ILogger;

function init():void
{
	logger = LogFactory.manufacture();
}
