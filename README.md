# sen-mavenized
So far, this is effectively just a mirror of the code for Sen 1.2.2.1, a [Java wrapper for MeCab](https://www.mlab.im.dendai.ac.jp/~yamada/ir/MorphologicalAnalyzer/Sen.html) which is [hosted on java.net](https://java.net/projects/sen), in preparation for the fact that the java.net forge will [close permanently](https://about.java.net/) on April 28th, 2017. I had actually hoped to upload it to a Maven repository, but still need to figure out how to do so. For now, I simply include the steps for Mavenizing it locally, translated from [this webpage](https://hondou.homedns.org/pukiwiki/pukiwiki.php?Java%20SEN%20%A4%C7%B7%C1%C2%D6%C1%C7%B2%F2%C0%CF#d971f576).

## Installing the jar to your local Maven repository
Clone the `sen-mavenized` repository to any folder - for this example, we will be assuming the Downloads folder.

Run the following script, replacing the filepath `-Dfile=...` with whatever filepath leads to sen.jar on your system:

```
mvn install:install-file -Dfile=~/Downloads/sen-mavenized/lib/sen.jar -DgroupId=sen-mavenized -DartifactId=sen -Dversion=1.2.2.1 -Dpackaging=jar -DgeneratePom=true
```

Next you need to add its dependency upon `commons-logging`. First, enter the folder containing its pom file via `cd ~/.m2/repository/sen-mavenized/sen/1.2.2.1`.

... Now overwrite all of the contents of the `sen-1.2.2.1.pom` with the following:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd" xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <modelVersion>4.0.0</modelVersion>
  <groupId>sen-mavenized</groupId>
  <artifactId>sen</artifactId>
  <version>1.2.2.1</version>
  <packaging>jar</packaging>

  <name>Sen</name>
  <description>A Java binding for MeCab</description>
  <url>https://www.mlab.im.dendai.ac.jp/~yamada/ir/MorphologicalAnalyzer/Sen.html</url>

  <licenses>
    <license>
      <name>GNU Lesser General Public License, Version 2.1</name>
      <url>http://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html</url>
      <distribution>repo</distribution>
    </license>
  </licenses>

  <scm>
    <url>https://java.net/projects/sen</url>
  </scm>

  <dependencies>
    <dependency>
      <groupId>commons-logging</groupId>
        <artifactId>commons-logging</artifactId>
        <version>1.1.1</version>
    </dependency>  
  </dependencies>
</project>
```
The actual key part is only the `<dependencies>` section. I don't actually know whether this whole step is necessary (as it seems to work without it), but it was [recommended](https://hondou.homedns.org/pukiwiki/pukiwiki.php?Java%20SEN%20%A4%C7%B7%C1%C2%D6%C1%C7%B2%F2%C0%CF#d971f576).

## Adding the jar as a dependency in your Maven build
Navigate to your project's pom.xml and add the following dependency:
```xml
<dependency>
  <groupId>sen-mavenized</groupId>
  <artifactId>sen</artifactId>
  <version>1.2.2.1</version>
</dependency>
```
