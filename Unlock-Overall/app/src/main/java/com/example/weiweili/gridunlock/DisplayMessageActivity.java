package com.example.weiweili.gridunlock;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class DisplayMessageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_message);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        Intent intent = getIntent();
        String message = intent.getStringExtra(MyActivity.EXTRA_MESSAGE);
        TextView textView = new TextView(this);
        textView.setTextSize(10);
//        textView.set
        textView.setText(message);

        RelativeLayout layout = (RelativeLayout) findViewById(R.id.content);
        layout.addView(textView);

        //打开或创建test.db数据库
//        SQLiteDatabase db = openOrCreateDatabase("test.db", Context.MODE_PRIVATE, null);
//        db.execSQL("DROP TABLE IF EXISTS Output");
//        db.execSQL("CREATE TABLE Output (name VARCHAR PRIMARY KEY, text VARCHAR)");
        //创建person表
//        db.execSQL("CREATE TABLE Output (_id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, age SMALLINT)");
//        Person person = new Person();
//        person.name = "john";
//        person.age = 30;
//        //插入数据
//        db.execSQL("INSERT INTO person VALUES (NULL, ?, ?)", new Object[]{person.name, person.age});

//        person.name = "david";
//        person.age = 33;
//        //ContentValues以键值对的形式存放数据
//        ContentValues cv = new ContentValues();
//        cv.put("name", "output");
//        cv.put("text", message);
        //插入ContentValues中的数据
//        db.insert("Output", null, cv);

//        cv = new ContentValues();
//        cv.put("age", 35);
//        //更新数据
//        db.update("person", cv, "name = ?", new String[]{"john"});

//        Cursor c = db.rawQuery("SELECT * FROM person WHERE age >= ?", new String[]{"33"});
//        while (c.moveToNext()) {
//            int _id = c.getInt(c.getColumnIndex("_id"));
//            String name = c.getString(c.getColumnIndex("name"));
//            int age = c.getInt(c.getColumnIndex("age"));
//            Log.i("db", "_id=>" + _id + ", name=>" + name + ", age=>" + age);
//        }
//        c.close();

        //删除数据
//        db.delete("person", "age < ?", new String[]{"35"});

        //关闭当前数据库
//        db.close();



//
//        Log.w("output", message);
//
//
//        FileOutputStream fop = null;
//        File file;
//        String content = message;
//
//        try {
//
//            file = new File("/Users/FredQiu/Desktop/filename.txt");
//            fop = new FileOutputStream(file);
//
//            // if file doesnt exists, then create it
//            if (!file.exists()) {
//                file.createNewFile();
//            }
//
//            // get the content in bytes
//            byte[] contentInBytes = content.getBytes();
//
//            fop.write(contentInBytes);
//            fop.flush();
//            fop.close();
//
//            System.out.println("Done");
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (fop != null) {
//                    fop.close();
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//
//        String filename = "/Users/FredQiu/Desktop/filename.txt";
//        String string = message;
//        FileOutputStream outputStream;
//
//        try {
//            outputStream = openFileOutput(filename, Context.MODE_PRIVATE);
//            outputStream.write(string.getBytes());
//            outputStream.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }


    }


    public void next(View view){

        Intent intent = new Intent(this, BigSix.class);
        startActivity(intent);

    }

}
