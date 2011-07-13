//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import flash.system.Capabilities;

import org.hamcrest.assertThat;
import org.hamcrest.text.containsString;
import org.hamcrest.text.endsWith;

import org.helvector.logging.HelLogger;

import helLogSuite.helpers.UnitTestTarget;

public class LoggingTest
{

	private function makePrefix(method:String):String
	{
		if (Capabilities.isDebugger)
			return "helLogSuite.tests::LoggingTest/" + method + "() ";

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

		assertThat(target.message, containsString(prefix));

		logger.log("Alpha");

		assertThat(target.message, containsString(prefix+"Alpha"));

        logger.log("Beta");

        assertThat(target.message, containsString(prefix+"Beta"));
	}

	[Test]
	public function removeTarget():void
	{
		var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);
		logger.log("Alpha");

		var expected:String = makePrefix("removeTarget") + "Alpha";

		assertThat(target.message, containsString(expected));

		logger.remove(target);

		logger.log("Beta");

        assertThat(target.message, containsString(expected));
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

        assertThat(targetA.message, containsString(expected));
        assertThat(targetB.message, containsString(expected));
        assertThat(targetC.message, containsString(expected));

		logger.clear();

		logger.log('Clear');

		assertThat(targetA.message, containsString(expected));
        assertThat(targetB.message, containsString(expected));
        assertThat(targetC.message, containsString(expected));
	}

	[Test]
	public function shouldSubstitue():void
	{
		var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);

		logger.log("A {0} B {1} C {2}", "a", "b", "c");

		assertThat(target.message, endsWith("A a B b C c"));

		logger.log("A {0} B {1} C {2}", "a", "b", "c", "d", "e", "f");

		assertThat(target.message, endsWith("A a B b C c"));

		logger.log("A {0} B {1} C {2}", "1", "2", "3");

		assertThat(target.message, endsWith("A 1 B 2 C 3"));

		logger.log("A{ 0 }B{ 1 }C{ 2 }");

		assertThat(target.message, endsWith("A{ 0 }B{ 1 }C{ 2 }"));

		logger.log("A{ 0 }B {1} C{ 2 }", "z", "Z", "x", "X");

		assertThat(target.message, endsWith("A{ 0 }B Z C{ 2 }"));
	}

	[Test]
	public function shouldLogInfo():void
	{
	    var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);

		logger.info("A {0} B {1}", "1", "2");

		assertThat(target.message, endsWith("A 1 B 2"));
		assertThat(target.message, containsString("[INFO]"));
	}

	[Test]
	public function shouldLogDebug():void
	{
	    var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);

		logger.debug("A {0} B {1}", "1", "2");

		assertThat(target.message, endsWith("A 1 B 2"));
		assertThat(target.message, containsString("[DEBUG]"));
	}
}

}