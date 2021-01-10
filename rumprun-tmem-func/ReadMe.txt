Σε αυτό το directory περιέχεται το porting της tmem ως function call σε rumprun unikernel περιβάλλον.

Τα αρχεία που επιτελούν την utmem, είναι:
1.tmem.h
Περιέχει απαραίτητα declarions που χρησιμοποιεί και το back-end
2.tmem_ops.h
Περιέχει τα declarations των 3 operations. Το API που βλέπει κάθε εφαρμογή
3.tmem_ops.c
Περέχει το implemention των 3 operations, μέχρι και την κλήση της hypercall
4.tmem_kvm_hypercall
Περιέχει απαραίτητα defintions που απαιτέι η hypercall

Επίσης υπάρχει και ένα userspace πρόγραμμα που επιδεικνύει την χρήση όλου του κώδικα, το hypercallDemonstrator.c
Το Makefile δημιουργεί το αντίστοιχο unikernel, μέχρι και την μορφή .bin
Για να δημιουργηθεί σωστά πρέπει να τεθούν οι μεταβλητές στην αρχή στο σωστό path
Για να εκτελεστεί σωστά πρέπει να τρέξουμε το unikernel επάνω στο kvm, δηλαδή
$rumprun kvm -i hypercallDemonstrator.bin
