# ntua-diplwmatikh
Υλοποίηση της διπλωματικής μου για το Εθνικό Μετσόβιο Πολυτεχνείο με Θέμα "Υλοποίηση μηχανισμού
ελαστικής μνήμης Utmem σε περιβάλλον Unikernel"

Σε κάθε φάκελο υπάρχει κώδικας που επιτελεί συγκεκριμένη λειτουργία
που περιγράφεται στην διπλωματική. Καθώς και scripts που διευκολύνουν
την χρήση τους.

1. **redis-patches**
Patches που ενσωματώνουν στο redis-server utmem δυνατότητες ως function call
2. **rumprun-patches**
Patches που εισάγουν και υλοποιούν την system call tmem για το rumprun
3. **rumprun-tmem-func**
Driver που δίνει την utmem δυνατήτοτα ως function call
4. **rumprun-tmem-lib**
Driver που δίνει την utmem δυνατήτοτα ως system call
5. **speed-evalutation**
Βοηθητικά προγράμματα που χρησιμοποιήθηκαν στο κομμάτι των μετρήσεων
6. **redis-module**
Το module για redis με την αυθεντική utmem, όπου έχουν προστεθέι εντολές καταγραφής χρόνου των επι μέρους σταδίων
7. **paper**
Κώδικας σε latex ο οποίος παράγει την τελική εργασία
8. **original-tmem-speed-test**
Υπολογισμός καθυστέρης αιτημάτων αυθεντικής utmem


Για διευκρινίσεις e-mail: el15103@central.ntua.gr ή johnnykef@hotmail.com
