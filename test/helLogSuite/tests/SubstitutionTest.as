//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import org.flexunit.Assert;

import org.helvector.logging.util.MessageSubstitutor;

public class SubstitutionTest
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

		res = substitutor.run("A {0} X {1}", [["b", "c"], ["y", "z"]]);

		Assert.assertEquals("A b,c X y,z",res);
	}

}

}