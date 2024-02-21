# This rule generates a file step1_output.txt that is an input to step2.
# The location of step1_output.txt is chosen by bazel, so you need to use $(OUTS) to refer to it.
# This rule uses input.txt as an input.
# input.txt will be moved by bazel before this rule is run, so you need to use $(SRCS) to refer to it.
genrule(
    name = "step1",
    srcs = ["input.txt"],
    outs = ["step1_output.txt"],
    cmd = """
    echo "Hello, `cat $(SRCS)`" > $(OUTS)
    """,
)

# This rule takes the output of step1 as an input, and generates step2_output.txt as an output.
genrule(
    name = "step2",
    srcs = ["step1_output.txt"],
    outs = ["step2_output.txt"],
    cmd = """
    echo "`cat $(SRCS)`, again" > $(OUTS)
    """,
)

# This rule takes the output of step2 as an input, and generates an executable script deploy.sh.
# `bazel build genrules:deploy` will generate deploy.sh
# `bazel run genrules:deploy` will run deploy.sh
# In this example, deploy.sh will open the output of step2 in your system file viewer.
genrule(
    name = "deploy",
    srcs = ["step2_output.txt"],
    outs = ["deploy.sh"],
    cmd = """
    echo "open $(SRCS)" > $(OUTS)
    """,
    executable = True,
)