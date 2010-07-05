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
import org.helvector.logging.util.MessageSubstitutor;

import helLogSuite.helpers.UnitTestTarget;

public class SubstitutionTests
{
	[Test]
	public function directly():void
	{

		var substitutor:MessageSubstitutor = new MessageSubstitutor();
		var res:String = "";

		res = substitutor.run("A {0} B {1} C {2}", ["a", "b", "c"]);

		Assert.assertEquals("A a B b C c",res);

		res = substitutor.run("A {0} B {1} C {2}", ["a", "b", "c", "d", "e", "f"]);

		Assert.assertEquals("A a B b C c",res);

		res = substitutor.run("A {0} B {1} C {2}", ["1", "2", "3"]);

		Assert.assertEquals("A 1 B 2 C 3",res);

		res = substitutor.run("A{ 0 }B{ 1 }C{ 2 }", []);

		Assert.assertEquals("A{ 0 }B{ 1 }C{ 2 }",res);

		res = substitutor.run("A{ 0 }B {1} C{ 2 }", ["z", "Z", "x", "X"]);

		Assert.assertEquals("A{ 0 }B Z C{ 2 }",res);
	}

	[Test]
	public function viaLogger():void
	{

		var target:UnitTestTarget = new UnitTestTarget();
		var logger:HelLogger = new HelLogger(4);

		logger.add(target);

		var expectedBase:String = "";

		if (Capabilities.isDebugger)
			expectedBase += "helLogSuite.tests::SubstitutionTests/viaLogger() ";

		logger.log("A {0} B {1} C {2}", ["a", "b", "c"]);

		Assert.assertEquals(expectedBase+"A a B b C c",target.message);

		logger.log("A {0} B {1} C {2}", ["a", "b", "c", "d", "e", "f"]);

		Assert.assertEquals(expectedBase+"A a B b C c",target.message);

		logger.log("A {0} B {1} C {2}", ["1", "2", "3"]);

		Assert.assertEquals(expectedBase+"A 1 B 2 C 3",target.message);

		logger.log("A{ 0 }B{ 1 }C{ 2 }");

		Assert.assertEquals(expectedBase+"A{ 0 }B{ 1 }C{ 2 }",target.message);

		logger.log("A{ 0 }B {1} C{ 2 }", ["z", "Z", "x", "X"]);

		Assert.assertEquals(expectedBase+"A{ 0 }B Z C{ 2 }",target.message);

	}
}

}