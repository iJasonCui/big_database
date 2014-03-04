package com.lavalife.mobile.ui;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTabHost;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.lavalife.mobile.service.LavalifeService;
import com.lavalife.mobile.ui.search.FilterFragment;
import com.lavalife.mobile.ui.search.GridFragment;
import com.lavalife.mobile.ui.search.SavedFragment;
import com.lavalife.mobile.ui.search.SearchListFragment;
/**
 * A Fragment managers all the tabs 
 * 
 * @author Jeff Yang
 *
 */
public class TabsFragment extends Fragment {
    public static final String MENU_ITEM_ID = "menu_item_id";

    private FragmentTabHost mTabHost;

    public TabsFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_search, container, false);
        int position = getArguments().getInt(MENU_ITEM_ID);
        String itemName = getResources().getStringArray(R.array.menu_array)[position];
        MainActivity activity = (MainActivity) getActivity();
        activity.setTitle(itemName);

        mTabHost = (FragmentTabHost) rootView.findViewById(android.R.id.tabhost);
        mTabHost.setup(getActivity(), getChildFragmentManager(), R.id.search_tabcontent);

        switch (position) {
        case 0:
            mTabHost.addTab(mTabHost.newTabSpec("carousel").setIndicator("Carousel"), TempTabFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("likes").setIndicator("Likes"), TempTabFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("matches").setIndicator("Matches"), TempTabFragment.class, null);
            break;
        case 1:
            mTabHost.clearAllTabs();
            if (LavalifeService.INSTANCE.isGridView()) {
                mTabHost.addTab(mTabHost.newTabSpec("grid_result").setIndicator("Results"), GridFragment.class, null);
            } else {
                mTabHost.addTab(mTabHost.newTabSpec("list_result").setIndicator("Results"), SearchListFragment.class, null);
            }
            mTabHost.addTab(mTabHost.newTabSpec("filter").setIndicator("Filter"), FilterFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("saved").setIndicator("Saved"), SavedFragment.class, null);
            break;
        case 2:
            mTabHost.addTab(mTabHost.newTabSpec("who").setIndicator("Who likes you"), TempTabFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("matches").setIndicator("Matches"), TempTabFragment.class, null);
            break;
        case 3:
            mTabHost.addTab(mTabHost.newTabSpec("inbox").setIndicator("Inbox"), TempTabFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("sent").setIndicator("Sent"), TempTabFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("deleted").setIndicator("Deleted"), TempTabFragment.class, null);
            break;
        case 4:
            mTabHost.addTab(mTabHost.newTabSpec("viewedme").setIndicator("Who viewed me"), TempTabFragment.class, null);
            mTabHost.addTab(mTabHost.newTabSpec("iviewed").setIndicator("Who I viewed"), TempTabFragment.class, null);
        default:
            mTabHost.addTab(mTabHost.newTabSpec("notabs").setIndicator("empty"), TempTabFragment.class, null);
            mTabHost.getTabWidget().getChildAt(0).setVisibility(View.GONE);
            break;
        }

        return rootView;
    }

    public void toggleResult() {
        boolean isGridView = LavalifeService.INSTANCE.isGridView();
        mTabHost.clearAllTabs();
        if (isGridView) {
            mTabHost.addTab(mTabHost.newTabSpec("list_result").setIndicator("Results"), SearchListFragment.class, null);
        } else {
            mTabHost.addTab(mTabHost.newTabSpec("grid_result").setIndicator("Results"), GridFragment.class, null);
        }
        LavalifeService.INSTANCE.setGridView(!isGridView);
        mTabHost.addTab(mTabHost.newTabSpec("filter").setIndicator("Filter"), FilterFragment.class, null);
        mTabHost.addTab(mTabHost.newTabSpec("saved").setIndicator("Saved"), SavedFragment.class, null);

    }

    public void showResult() {
        mTabHost.setCurrentTab(0);
    }
}