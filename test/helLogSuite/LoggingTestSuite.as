//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 Simong Gregory.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite
{

import helLogSuite.tests.HelLogLevelTests;
import helLogSuite.tests.LogEnvTests;
import helLogSuite.tests.LoggingTests;
import helLogSuite.tests.SubstitutionTests;
import helLogSuite.tests.TimeStampTests;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class LoggingTestSuite
{
	public var loggingTests:LoggingTests;
	public var subsitutionTests:SubstitutionTests;
	public var timeStampTests:TimeStampTests;
	public var logEnvTests:LogEnvTests;
	public var helLogLevelTests:HelLogLevelTests;
}

}