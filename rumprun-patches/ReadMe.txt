Σε αυτό το directory εμπεριέχονται τα κατάλληλα patch ώστε να προστεθεί
η system call tmem, στα rumpkerel και κατ επέκταση στο rumprun.
Η εισαγωγή αυτών είναι απαραίτητη εφόσον κάποιος θέλει να χρησιμοποιήσει
την tmem με system call.
Προς αποφυγή παρεξηγήσεων, tmem ονομάζεται η system call που υλοποιείται

Το script setFiles.sh αυτοματοποιεί την αντιγραφή των αρχείων στην σωστή θέση
εφόσον τα paths στην αρχή οριστούν σωστά. Η εκτελεση του είναι
$./setFiles.sh

Τα αρχεία είναι τα εξής:

1.syscalls.master
Δηλώνει στο NetBSD πως υπάρχει μια νέα διαθέσιμη system call, η tmem.
Αυτό γίνεται στην γραμμή 988. H tmem έχει αριθμό 483
2.rumpkern_syscalls.c
Ενημερώνουμε τους rumpkernels πως επιθυμούμε να συμπεριληφθεί η tmem.
Γραμμή 79 και 149
3.Makefile.rumpkern
Ενημερώνουμε τους rumpkernels να μεταγλωτίσουν τον πηγαίο κώδικα της tmem.
Γραμμή 131
4.tmem_kernel.h
Περιέχει τα value declarions που είναι κοινά με το back end ώστε να επικοι-
νωνούμε σωστά. Επίσης περιέχει και declarions που σχετίζονται με την hypercall.
5.sys_tmem.c
H υλοποίηση της system call tmem. Κάτι ο,τι είναι αναμενόμενο μέχρι και την
hypercall. Εξαρτάται από το αρχείο tmem_kernel.h

Αφού εκτελεστεί το script setFiles.sh, πρέπει να ξαναγίνει build το rumprun
(και άρα όλο το toolchain από την αρχή) κατά τον γνωστό τρόπο. Μετά από αυτό
οποιοδήποτε unikernel μπορεί να χρησιμοποιεί την system call tmem, η οποία θα
γίνεται resolve κατά το bake.
