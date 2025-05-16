# % bash query_timer.sh label num_reps query db_file csv_file

#!/bin/bash

# Assign arguments to variables
label="$1"
num_reps="$2"
query="$3"
db_file="$4"
csv_file="$5"

# Capture start time using SECONDS
start_time=$SECONDS

# Run query num_reps times
for i in $(seq "$num_reps"); do
    echo "Iteration: $i"
    duckdb "$db_file" -c "$query" > /dev/null 2>&1
done

# Capture end time
end_time=$SECONDS

# Compute elapsed time
elapsed_time=$((end_time - start_time))

# Compute average time per query (using `bc` for floating point division)
avg_time=$(echo "scale=7; $elapsed_time / $num_reps" | bc)

# Append results to CSV file
echo "$label,$avg_time" >> "$csv_file"