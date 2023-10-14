from robot.running import TestSuite

# Create suite from a JSON string.
suite = TestSuite.from_json('{"name": "Suite", "tests": [{"name": "Test"}]}')

print(suite)