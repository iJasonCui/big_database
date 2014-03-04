package com.lavalife.mobile.ui.search;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.lavalife.mobile.service.SavedSearch;
import com.lavalife.mobile.ui.R;
import com.lavalife.mobile.ui.TabsFragment;
/**
 * Saved Search View 
 * 
 * @author Jeff Yang 
 *
 */
public class SavedFragment extends ListFragment {

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {
        TabsFragment t = (TabsFragment) getParentFragment();
        t.showResult();
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View list_root = inflater.inflate(R.layout.fragment_saved, null);

        SavedSearchAdapter adapter = new SavedSearchAdapter(getActivity());
        for (int i = 1; i < 20; i++) {
            SavedSearch c = new SavedSearch();
            c.setName(getName(i));
            c.setOrdinal(i);
            adapter.add(c);
        }
        setListAdapter(adapter);
        return list_root;
    }

    public class SavedSearchAdapter extends ArrayAdapter<SavedSearch> {

        public SavedSearchAdapter(Context context) {
            super(context, 0);
        }

        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.saved_item, null);
            }
            TextView title = (TextView) convertView.findViewById(R.id.saved_title);
            TextView name = (TextView) convertView.findViewById(R.id.saved_name);
            SavedSearch search = getItem(position);
            name.setText(search.getName());
            title.setText(String.valueOf(search.getOrdinal()));
            title.setTextColor(Color.parseColor("#FFFFFF"));
            title.setBackgroundColor(Color.parseColor(getColorCode(search.getOrdinal())));
            return convertView;
        }

    }

    
    
    
    // Sample color for fun TODO 
    private String getColorCode(int ordinal) {
        String color = "#FFFF33";

        switch (ordinal % 5) {
        case 1:
            color = "#FF9900";
            break;
        case 2:
            color = "#99CC00";
            break;
        case 3:
            color = "#FF6600";
            break;
        case 4:
            color = "#990099";
            break;
        case 0:
            color = "#FFCC00";
            break;

        }

        return color;
    }

    private String getName(int ordinal) {
        String color = "Local women";

        switch (ordinal % 5) {
        case 1:
            color = "Women in Toronto";
            break;
        case 2:
            color = "Women online";
            break;
        case 3:
            color = "Women in Shanghai";
            break;
        case 4:
            color = "Asian women";
            break;
        case 0:
            color = "Women under 30";
            break;

        }

        return color;
    }

}
