# ntua-diplwmatikh
##Υλοποίηση της διπλωματικής μου για το Εθνικό Μετσόβιο Πολυτεχνείο με Θέμα "Υλοποίηση της μηχανισμού utmem ως unikernel"

Σε κάθε φάκελο υπάρχει κώδικας που επιτελεί συγκεκριμένη λειτουργία
που περιγράφεται στην διπλωματική. Καθώς και scripts που διευκολύνουν
την χρήση τους.

1. **redis-patches**
Patches που ενσωματώνουν στο redis-server utmem δυνατότητες
2. **rumprun-patches**
Patches που εισάγουν και υλοποιούν την system call tmem για το rumprun
3. **rumprun-tmem-func**
Driver που δίνει την utmem δυνατήτοτα μόνο με system call
4. **rumprun-tmem-lib**
Driver που δίνει την utmem δυνατήτοτα με χρήση της system call tmem
