<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>
			  <list_result_search
				v-if="$check_action('/visitor/list', 'get')"
				:list="result_visitor_guest_account_"
				title="访客访客账号"
				source_table="visitor"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/owner/list', 'get')"
				:list="result_owner_owner_account_number"
				title="业主业主账号"
				source_table="owner"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/owner/list', 'get')"
				:list="result_owner_building_no"
				title="业主楼栋号"
				source_table="owner"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/owner/list', 'get')"
				:list="result_owner_house_number"
				title="业主门牌号"
				source_table="owner"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/visit/list', 'get')"
				:list="result_visit_full_name"
				title="来访登记姓名"
				source_table="visit"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/repair_application/list', 'get')"
				:list="result_repair_application_repair_type"
				title="报修申请报修类型"
				source_table="repair_application"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/repair_application/list', 'get')"
				:list="result_repair_application_full_name"
				title="报修申请姓名"
				source_table="repair_application"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/repair_application/list', 'get')"
				:list="result_repair_application_building_no"
				title="报修申请楼栋号"
				source_table="repair_application"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/repair_application/list', 'get')"
				:list="result_repair_application_house_number"
				title="报修申请门牌号"
				source_table="repair_application"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/voting_center/list', 'get')"
				:list="result_voting_center_voting_title"
				title="投票中心 投票标题"
				source_table="voting_center"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/voting_management/list', 'get')"
				:list="result_voting_management_voting_title"
				title="投票管理 投票标题"
				source_table="voting_management"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/voting_management/list', 'get')"
				:list="result_voting_management_voting_status"
				title="投票管理表决状态"
				source_table="voting_management"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/feedback_center/list', 'get')"
				:list="result_feedback_center_feedback_title"
				title="反馈中心反馈标题"
				source_table="feedback_center"
			  ></list_result_search>
			  <list_result_search
				v-if="$check_action('/feedback_center/list', 'get')"
				:list="result_feedback_center_feedback_type"
				title="反馈中心反馈类型"
				source_table="feedback_center"
			  ></list_result_search>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
			"result_visitor_guest_account_":[],
			"result_owner_owner_account_number":[],
			"result_owner_building_no":[],
			"result_owner_house_number":[],
			"result_visit_full_name":[],
			"result_repair_application_repair_type":[],
			"result_repair_application_full_name":[],
			"result_repair_application_building_no":[],
			"result_repair_application_house_number":[],
			"result_voting_center_voting_title":[],
			"result_voting_management_voting_title":[],
			"result_voting_management_voting_status":[],
			"result_feedback_center_feedback_title":[],
			"result_feedback_center_feedback_type":[],
	};
  },
  methods: {
	/**
	 * 获取guest_account_
	 */
	get_visitor_guest_account_(){
		this.$get("~/api/visitor/get_list?like=0", { page: 1, size: 10, "guest_account_": this.query.word }, (json) => {
		  if (json.result) {
			var result_visitor_guest_account_ = json.result.list;
			result_visitor_guest_account_.map(o => o.title = o['guest_account_'])
	  			this.result_visitor_guest_account_ = result_visitor_guest_account_
		 	}
		});
	},
	/**
	 * 获取owner_account_number
	 */
	get_owner_owner_account_number(){
		this.$get("~/api/owner/get_list?like=0", { page: 1, size: 10, "owner_account_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_owner_owner_account_number = json.result.list;
			result_owner_owner_account_number.map(o => o.title = o['owner_account_number'])
	  			this.result_owner_owner_account_number = result_owner_owner_account_number
		 	}
		});
	},
	/**
	 * 获取building_no
	 */
	get_owner_building_no(){
		this.$get("~/api/owner/get_list?like=0", { page: 1, size: 10, "building_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_owner_building_no = json.result.list;
			result_owner_building_no.map(o => o.title = o['building_no'])
	  			this.result_owner_building_no = result_owner_building_no
		 	}
		});
	},
	/**
	 * 获取house_number
	 */
	get_owner_house_number(){
		this.$get("~/api/owner/get_list?like=0", { page: 1, size: 10, "house_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_owner_house_number = json.result.list;
			result_owner_house_number.map(o => o.title = o['house_number'])
	  			this.result_owner_house_number = result_owner_house_number
		 	}
		});
	},
	/**
	 * 获取full_name
	 */
	get_visit_full_name(){
		this.$get("~/api/visit/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_visit_full_name = json.result.list;
			result_visit_full_name.map(o => o.title = o['full_name'])
	  			this.result_visit_full_name = result_visit_full_name
		 	}
		});
	},
	/**
	 * 获取repair_type
	 */
	get_repair_application_repair_type(){
		this.$get("~/api/repair_application/get_list?like=0", { page: 1, size: 10, "repair_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_repair_application_repair_type = json.result.list;
			result_repair_application_repair_type.map(o => o.title = o['repair_type'])
	  			this.result_repair_application_repair_type = result_repair_application_repair_type
		 	}
		});
	},
	/**
	 * 获取full_name
	 */
	get_repair_application_full_name(){
		this.$get("~/api/repair_application/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_repair_application_full_name = json.result.list;
			result_repair_application_full_name.map(o => o.title = o['full_name'])
	  			this.result_repair_application_full_name = result_repair_application_full_name
		 	}
		});
	},
	/**
	 * 获取building_no
	 */
	get_repair_application_building_no(){
		this.$get("~/api/repair_application/get_list?like=0", { page: 1, size: 10, "building_no": this.query.word }, (json) => {
		  if (json.result) {
			var result_repair_application_building_no = json.result.list;
			result_repair_application_building_no.map(o => o.title = o['building_no'])
	  			this.result_repair_application_building_no = result_repair_application_building_no
		 	}
		});
	},
	/**
	 * 获取house_number
	 */
	get_repair_application_house_number(){
		this.$get("~/api/repair_application/get_list?like=0", { page: 1, size: 10, "house_number": this.query.word }, (json) => {
		  if (json.result) {
			var result_repair_application_house_number = json.result.list;
			result_repair_application_house_number.map(o => o.title = o['house_number'])
	  			this.result_repair_application_house_number = result_repair_application_house_number
		 	}
		});
	},
	/**
	 * 获取voting_title
	 */
	get_voting_center_voting_title(){
		this.$get("~/api/voting_center/get_list?like=0", { page: 1, size: 10, "voting_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_voting_center_voting_title = json.result.list;
			result_voting_center_voting_title.map(o => o.title = o['voting_title'])
	  			this.result_voting_center_voting_title = result_voting_center_voting_title
		 	}
		});
	},
	/**
	 * 获取voting_title
	 */
	get_voting_management_voting_title(){
		this.$get("~/api/voting_management/get_list?like=0", { page: 1, size: 10, "voting_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_voting_management_voting_title = json.result.list;
			result_voting_management_voting_title.map(o => o.title = o['voting_title'])
	  			this.result_voting_management_voting_title = result_voting_management_voting_title
		 	}
		});
	},
	/**
	 * 获取voting_status
	 */
	get_voting_management_voting_status(){
		this.$get("~/api/voting_management/get_list?like=0", { page: 1, size: 10, "voting_status": this.query.word }, (json) => {
		  if (json.result) {
			var result_voting_management_voting_status = json.result.list;
			result_voting_management_voting_status.map(o => o.title = o['voting_status'])
	  			this.result_voting_management_voting_status = result_voting_management_voting_status
		 	}
		});
	},
	/**
	 * 获取feedback_title
	 */
	get_feedback_center_feedback_title(){
		this.$get("~/api/feedback_center/get_list?like=0", { page: 1, size: 10, "feedback_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_feedback_center_feedback_title = json.result.list;
			result_feedback_center_feedback_title.map(o => o.title = o['feedback_title'])
	  			this.result_feedback_center_feedback_title = result_feedback_center_feedback_title
		 	}
		});
	},
	/**
	 * 获取feedback_type
	 */
	get_feedback_center_feedback_type(){
		this.$get("~/api/feedback_center/get_list?like=0", { page: 1, size: 10, "feedback_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_feedback_center_feedback_type = json.result.list;
			result_feedback_center_feedback_type.map(o => o.title = o['feedback_type'])
	  			this.result_feedback_center_feedback_type = result_feedback_center_feedback_type
		 	}
		});
	},

  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
		this.get_visitor_guest_account_();
		this.get_owner_owner_account_number();
		this.get_owner_building_no();
		this.get_owner_house_number();
		this.get_visit_full_name();
		this.get_repair_application_repair_type();
		this.get_repair_application_full_name();
		this.get_repair_application_building_no();
		this.get_repair_application_house_number();
		this.get_voting_center_voting_title();
		this.get_voting_management_voting_title();
		this.get_voting_management_voting_status();
		this.get_feedback_center_feedback_title();
		this.get_feedback_center_feedback_type();
  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_visitor_guest_account_();
	  this.get_owner_owner_account_number();
	  this.get_owner_building_no();
	  this.get_owner_house_number();
	  this.get_visit_full_name();
	  this.get_repair_application_repair_type();
	  this.get_repair_application_full_name();
	  this.get_repair_application_building_no();
	  this.get_repair_application_house_number();
	  this.get_voting_center_voting_title();
	  this.get_voting_management_voting_title();
	  this.get_voting_management_voting_status();
	  this.get_feedback_center_feedback_title();
	  this.get_feedback_center_feedback_type();
	},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
