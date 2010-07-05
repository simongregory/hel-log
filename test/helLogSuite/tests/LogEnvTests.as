//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import org.flexunit.Assert;

import org.helvector.logging.tools.LogEnv;

public class LogEnvTests
{

	[Test]
	public function doesGatherWork():void
	{
		var logEnv:LogEnv = new LogEnv();

		Assert.assertNotNull(logEnv.description);
	}

	[Test]
	public function reportedLineTotal():void
	{
		var logEnv:LogEnv = new LogEnv();
		var lines:Array = logEnv.description.split('\n');

		Assert.assertEquals(22,lines.length);
	}

	[Test]
	public function sectionTitles():void
	{
		var logEnv:LogEnv = new LogEnv();
		trace("LogEnvTests::sectionTitles()", logEnv.description);
		var lines:Array = logEnv.description.split('\n');

		Assert.assertEquals('CAPABILITIES',lines[1]);
		Assert.assertEquals('SYSTEM',lines[18]);
	}

	[Test]
	public function seperatorPosition():void
	{
		var logEnv:LogEnv = new LogEnv();
		var lines:Array = logEnv.description.split('\n');
	}


}

}