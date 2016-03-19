package com.example.weiweili.gridunlock;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.Date;
import java.util.Random;

public class SmallTen extends AppCompatActivity {

    public static int count = 0;
    public static String[] answer ;
    public final static String EXTRA_MESSAGE = "com.mycompany.myfirstapp.MESSAGE";
    public StringBuffer rec = new StringBuffer("");
    public StringBuffer acc = new StringBuffer("");
    public Date time1;
    public Date time2;
    public SQLiteDatabase db;
    public StringBuffer four = new StringBuffer("");
    public boolean flagTest = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        prinf(answer);
        setContentView(R.layout.activity_small_ten);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
    }

    public static void prinf(String[] str){
        if(str==null)
            return;
        System.out.println("I am gonna print the automatically generated array");
        for(String str1 : str){
            System.out.print(str1+" ");
        }
        System.out.println();
    }

    public static int generateNum() {
        Random rand = new Random();
        return rand.nextInt(9999 - 1000) + 1000;
    }


    public static String[] generateAnswerString(int K) {
        String[] result = new String[K];
        for (int i = 0; i < K; i++) {
            int number = generateNum();
            result[i] = String.valueOf(number);
        }
        return result;
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_my, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public void test(View view){
        flagTest = true;
        time1 = new Date();
        System.out.println(time1);
        count=0;
        answer = generateAnswerString(101);
        prinf(answer);
        TextView tmp = (TextView) findViewById(R.id.display);
        tmp.setText("round " + count + "");
        TextView tv = (TextView) findViewById(R.id.number);
        tv.setText(answer[count]);

        db = openOrCreateDatabase("test.db", Context.MODE_PRIVATE, null);
        db.execSQL("DROP TABLE IF EXISTS Output3");
        db.execSQL("CREATE TABLE Output3 (id INTEGER PRIMARY KEY AUTOINCREMENT, random_num VARCHAR, enter_num VARCHAR, mistake INTEGER, time FLOAT)");
    }

    public void begin(View view){
        flagTest = false;
        time1 = new Date();
        System.out.println(time1);
        count=0;
        answer = generateAnswerString(11);
        prinf(answer);
        TextView tmp = (TextView) findViewById(R.id.display);
        tmp.setText("round "+count+"");
        TextView tv = (TextView) findViewById(R.id.number);
        tv.setText(answer[count]);

        db = openOrCreateDatabase("test.db", Context.MODE_PRIVATE, null);
        db.execSQL("DROP TABLE IF EXISTS Output3");
        db.execSQL("CREATE TABLE Output3 (id INTEGER PRIMARY KEY AUTOINCREMENT, random_num VARCHAR, enter_num VARCHAR, mistake INTEGER, time FLOAT)");
    }


    public void skip(View view){
        Intent intent = new Intent(this, DisplaySmallTen.class);
        intent.putExtra(EXTRA_MESSAGE, acc.toString());
        startActivity(intent);
    }


    //Called when clicking Send button
    public void sendMessage(View view){
        Button b = (Button)view;
        String buttonText = b.getText().toString();
        System.out.println("the number pressed this time is:"+buttonText);
        rec.append(buttonText);
        acc.append(buttonText);
        four.append(buttonText);
        if(rec.length()==4){
            //the 1st round ends.
            time2 = new Date();
            ContentValues cv = new ContentValues();
            cv.put("random_num", answer[count]);
            cv.put("enter_num", four.toString());
            cv.put("time", (time2.getTime() - time1.getTime()) / 1000.0);
            acc.append("|"+(time2.getTime() - time1.getTime()) / 1000.0+"|");
            System.out.println((time2.getTime() - time1.getTime()) / 1000.0);
            //re-time for time1. The 2nd round starts.
            time1 = new Date();
            four = new StringBuffer("");

            if (rec.toString().equals(answer[count])) {
                //1 represents true
                cv.put("mistake", 1);
                db.insert("Output3", null, cv);

                System.out.println("correct");
                acc.append(" correct ");
                rec.setLength(0);
                count++;
                TextView tmp = (TextView) findViewById(R.id.display);
                System.out.println(tmp);
                tmp.setText("round "+count + "");
                TextView tv = (TextView) findViewById(R.id.number);
                //最后一个也要generate擦，我就直接generate11个了，省事儿
                tv.setText(answer[count]);
            } else {
                //0 represents false
                cv.put("mistake", 0);
                db.insert("Output3", null, cv);

                System.out.println("incorrect");
                acc.append(" incorrect ");
                count++;
                rec.setLength(0);
                TextView tmp = (TextView) findViewById(R.id.display);
                System.out.println(tmp);
                tmp.setText("round "+count + "");
                TextView tv = (TextView) findViewById(R.id.number);
                tv.setText(answer[count]);
            }


            if(count==10 && flagTest==false){
                Intent intent = new Intent(this, DisplaySmallTen.class);
                intent.putExtra(EXTRA_MESSAGE, acc.toString());
                startActivity(intent);
                db.close();
            }

        }
    }
}
