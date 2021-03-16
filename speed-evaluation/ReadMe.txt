Βοηθητικά προγράμματα που επιτελούν μετρήσεις και συγκρίσεις για την unikernel utmem και
την αυθεντική.

1. client.c
Συγκρίνει την unikernel utmem Put εντολή με in-memory Set εντολή.
Απαιτείται να τρέχει το redis-server ως unikernel με τα patches για την utmem, βλέπε αντίστοιχο
οδηγό στα rumprun-packages repos.
Αντιστοιχεί στο benchmarks.sh

2.client2.c
Συγκρίνει την unikernel utmem Put με την αυθεντική utmem Put.
Επίσης συγκρίνει  unikernel Set με αυθεντική Set.
Απαιτεί πάλι το redis-server και ως unikernel και ως process linux guest.
Το process του linux χρειάζεται το redis-module για να χρησιμοποιήσει την utmem.
Αντιστοιχεί στα benchmarks2-3-4.sh

3.client3.c
Αναλύει την καθυστέρηση των αιτημάτων ανάμεσα σε unikernel Put και αυθεντική Put.
Πάλι απαιτεί unikerel redis-server και κανονικό server.
Αντιστοιχεί στο benchmark5.sj.

4.Φάκελος breakdown.
Υλοποιεί Rumprun unikernel που αναλύει τα στάδια καθυστέρησης των Put και Get.
Χρησιμοποιεί την function call έκδοση.
