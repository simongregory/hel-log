//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package
{

import org.helvector.logging.ILogger;

public function get log():ILogger
{
    if (lgr == null) init();
    return lgr;
}

}

import org.helvector.logging.LogFactory;
import org.helvector.logging.ILogger;
import org.helvector.logging.targets.LogFile;

var lgr:ILogger;

function init():void
{
    lgr = LogFactory.manufacture();
    lgr.add(new LogFile);
}
