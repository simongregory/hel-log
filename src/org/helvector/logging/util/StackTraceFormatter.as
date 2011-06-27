//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.util
{

public class StackTraceFormatter
{

    private var _lineMatch:RegExp = /^\s+at\s([^\/]+)(\/)?(.*)?\(\)/i;

    public function line(stackLine:String):String
    {
		var matches:Array = _lineMatch.exec(stackLine);

		var clas:String = matches[1] || 'UnknownClass';
		var meth:String = matches[3] || clas;

		var origin:String = clas + '/' + meth + '()';

		return origin;
    }

}

}
