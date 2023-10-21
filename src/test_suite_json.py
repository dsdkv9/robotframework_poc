from robot.running import TestSuite

# Create suite from a JSON string.
suite = TestSuite.from_json('{"name": "Suite", "tests": [{"name": "Test"}]}')

print(suite)

s=''
i=1
for i in range(4):
    print(i+1)
    s=s+str(i+1)

print(s)