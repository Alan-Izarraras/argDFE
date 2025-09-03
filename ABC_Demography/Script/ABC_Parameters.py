#python3 sample_ranges.py --use_defaults
#python3 sample_ranges.py --n_past_range "0 100" --n_present_range "0 100" --time_range "0 24"

import random
import argparse
import os

# Define default ranges
DEFAULTS = {
    'n_past_range': (1000, 15000),
    'n_present_range': (1000, 40000),
    'time_range': (1, 1000),
}

seed = os.environ.get('SLURM_ARRAY_TASK_ID')

# Set up argument parser
parser = argparse.ArgumentParser(description="Generate random samples for N_past, N_present, and Time.")
parser.add_argument("--use_defaults", action="store_true", help="Use default parameter ranges")
parser.add_argument("--n_past_range", type=str, required=False, help="Range for N_past (e.g., '0 100')")
parser.add_argument("--n_present_range", type=str, required=False, help="Range for N_present (e.g., '0 100')")
parser.add_argument("--time_range", type=str, required=False, help="Range for Time (e.g., '0.0 24.0')")

# Parse arguments
args = parser.parse_args()

# Function to parse range string into min, max
def parse_range(range_str, is_float=False):
    try:
        # Split the range string and convert to appropriate type
        min_val, max_val = map(float if is_float else int, range_str.split())
        return min_val, max_val
    except ValueError:
        parser.error(f"Invalid range format: '{range_str}'. Expected two numbers (e.g., '0 100').")

# Determine parameter values
if args.use_defaults:
    # Use default values
    n_past_min, n_past_max = DEFAULTS['n_past_range']
    n_present_min, n_present_max = DEFAULTS['n_present_range']
    time_min, time_max = DEFAULTS['time_range']
else:
    # Check if all required range arguments are provided
    required_args = ['n_past_range', 'n_present_range', 'time_range']
    for arg in required_args:
        if getattr(args, arg) is None:
            parser.error(f"Argument --{arg} is required when --use_defaults is not specified.")

    # Parse ranges
    n_past_min, n_past_max = parse_range(args.n_past_range)
    n_present_min, n_present_max = parse_range(args.n_present_range)
    time_min, time_max = parse_range(args.time_range)


# Validate ranges
if n_past_min > n_past_max:
    parser.error("n_past_range min must be <= max")
if n_present_min > n_present_max:
    parser.error("n_present_range min must be <= max")
if time_min > time_max:
    parser.error("time_range min must be <= max")

# Generate random samples
N_past = random.randint(int(n_past_min), int(n_past_max))
N_present = random.randint(int(n_present_min), int(n_present_max))
Time = random.randint(int(time_min), int(time_max))
seed = int(seed)

# Print results
print(f"N_past: {N_past}")
print(f"N_present: {N_present}")
print(f"Time: {Time}")
print(f"Seed: {seed}")
