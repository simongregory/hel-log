//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import flash.system.Capabilities;

import org.flexunit.Assert;

import org.helvector.logging.HelLogger;

import helLogSuite.helpers.UnitTestTarget;

public class LoggingTests
{

	private function makePrefix(method:String):String
	{
		if (Capabilities.isDebugger)
			return "helLogSuite.tests::LoggingTests/" + method + "() ";

		return "";
	}

	[Test]
	public function addTarget():void
	{
		var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);

		var prefix:String = makePrefix("addTarget");

		logger.log("");

		Assert.assertEquals(prefix,target.message);

		logger.log("Alpha");

		Assert.assertEquals(prefix+"Alpha", target.message);

		logger.log("Beta");

		Assert.assertEquals(prefix+"Beta", target.message);

	}

	[Test]
	public function removeTarget():void
	{
		var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);
		logger.log("Alpha");

		var expected:String = makePrefix("removeTarget") + "Alpha";

		Assert.assertEquals(expected,target.message);

		logger.remove(target);

		logger.log("Beta");

		Assert.assertEquals(expected,target.message);

	}

	[Test]
	public function clearTargets():void
	{
		var logger:HelLogger = new HelLogger(4);

		var targetA:UnitTestTarget = new UnitTestTarget();
		var targetB:UnitTestTarget = new UnitTestTarget();
		var targetC:UnitTestTarget = new UnitTestTarget();

		logger.add(targetA);
		logger.add(targetB);
		logger.add(targetC);

		logger.log('A');

		var expected:String = makePrefix("clearTargets") + "A";

		Assert.assertEquals(expected,targetA.message);
		Assert.assertEquals(expected,targetB.message);
		Assert.assertEquals(expected,targetC.message);

		logger.clear();

		logger.log('Clear');

		Assert.assertEquals(expected,targetA.message);
		Assert.assertEquals(expected,targetB.message);
		Assert.assertEquals(expected,targetC.message);

	}
}

}