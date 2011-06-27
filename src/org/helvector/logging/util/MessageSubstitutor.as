//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.util
{

public class MessageSubstitutor implements ISubstitutor
{

	/**
	 * Cached regular expressions.
	 */
	protected var _matches:Array = [];

	/**
	 * Replaces all the {n} placeholders in 'string' with the corresponding
	 * 'values[n]'.
	 */
	public function run(string:String, values:Array):String
	{
		const all:uint = values.length;

		for (var i:uint = 0; i < all; i++)
		{
			string = string.replace(getMatch(i), values[i]);
		}

        return string;
	}

	/**
	 * Generates and caches a placehoder regular expression for the supplied
	 * index value.
	 */
	protected function getMatch(index:uint):RegExp
	{
		if (!_matches[index])
			_matches[index] = new RegExp("\\{"+index+"\\}", "g");

		return _matches[index];
	}

}

}