package example;

import org.junit.Test;

import static org.junit.Assert.assertTrue;


public class TargetTest {
    @Test
    public void testName() {
        var queuePrefix = "gh-readonly-queue";
        var branchName = System.getenv("BUILDKITE_BRANCH");
        var needFail = branchName != null && branchName.startsWith(queuePrefix);
        System.out.print(branchName);
        assertTrue(true);
    }
}