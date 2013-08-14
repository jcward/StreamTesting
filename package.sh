# package (for Android, though iOs exhibits behavior also with -sampler)
java -jar $AIR_HOME/lib/adt.jar -package -target apk-captive-runtime -storetype pkcs12 -keystore example.p12 -storepass example Main.apk app.xml Main.swf
