module test;

import xmlrpcc.client;

void main()
{
    auto client = new Client("http://phpxmlrpc.sourceforge.net/server.php");

    double resp1 = client.call!("examples.addtwodouble", double)(534.78, 168.36);
    string resp2 = client.call!("examples.stringecho", string)("Hello Galaxy!");
    assert(resp2 == "Hello Galaxy!");

    real resp2_1 = client.call!("examples.stringecho", real)("123.456"); // IMPLICIT CONVERSION
    int[string] resp3 = client.call!("validator1.countTheEntities", int[string])("A < C ' > 45\" 12 &");
    assert(1 == resp3["ctQuotes"]);
    assert(1 == resp3["ctLeftAngleBrackets"]);
    assert(1 == resp3["ctRightAngleBrackets"]);
    assert(1 == resp3["ctAmpersands"]);
    assert(1 == resp3["ctApostrophes"]);

    int[string][] arrayOfStructs = [["moe" : 1, "larry" : 2, "curly" : 3], ["moe" : -98, "larry" : 23, "curly" : -6]];
    int resp4 = client.call!("validator1.arrayOfStructsTest", int)(arrayOfStructs);
    assert(resp4 == -3);
}