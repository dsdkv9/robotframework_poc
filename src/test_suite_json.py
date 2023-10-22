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

def is_string_contains_int(n, test_str):
    str_to_check = str(n)
    is_found = False
    if str_to_check in test_str:
        is_found = True
    
    return is_found

print(is_string_contains_int(12, "hellow12A"))
print(is_string_contains_int(21, "hellow12A"))