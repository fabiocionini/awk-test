import \
    csv
import \
    random
import \
    sys

columns = ['operationtype', 'starttime', 'endtime']
operations = ['find', 'create', 'update', 'delete']
upper_range = 100
lower_range = 1

rows = 0
if len(sys.argv) > 1:
    rows = int(sys.argv[1])

if rows > 0:
    with open('operations.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(columns)
        for row in range(rows):
            operation_type = random.choice(operations)
            start_time = random.randint(lower_range, upper_range - 2)
            end_time = random.randint(start_time + 1, upper_range)
            writer.writerow([operation_type, start_time, end_time])
    print('Written {} rows'.format(rows))
else:
    print('Please enter a valid number of rows')
    sys.exit(1)

